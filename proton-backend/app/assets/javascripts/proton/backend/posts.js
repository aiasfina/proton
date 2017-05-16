function initPostForm(id, title, content) {

  id = id || null;
  title = title || '';
  content = content || '';

  var loading = false;
  var alert = '';

  function isNew() {
    return !id
  }

  function backToPosts() {
    if (confirm("It's still editing, ready to leave this page?")) {
      document.location.href = '/backend/posts'
    }
  }

  function submit() {
    loading = true;
    m.redraw();

    m.request({
      method: isNew() ? 'POST' : 'PUT',
      url: isNew() ? '/backend/posts' : '/backend/posts/' + id,
      data: {
        post: {
          title: title,
          content: content
        }
      },
      config: xhr => xhr.setRequestHeader('X-CSRF-Token', window.CSRF.token)
    })
    .then(function(resp) {
      id = resp.id;
      showAlert('Success.');
    })
    .then(function() {
      setTimeout(function() {
        loading = false;
        m.redraw();
      }, 1000);
    })
    .catch(function() {
      setTimeout(function() {
        loading = false;
        m.redraw();
      }, 1000);
    })
  }

  function showAlert(message) {
    alert = message;
    setTimeout(function() {
      alert = '';
      m.redraw();
    }, 2500);
  }

  var toolbar = {
    view: function(vnode) {
      return(
        m('.editorable-toolbar.clearfix', [
          m('.editorable-toolbar--column', [
            m('a.btn.btn-text.pull-left', {onclick: backToPosts}, 'Back')
          ]),
          m('.editorable-toolbar--column', [
            loading ? m('i.fa.fa-spinner.fa-spin') : m('p', alert)
          ]),
          m('.editorable-toolbar--column', [
            m('a.btn.btn-default.pull-right', {onclick: submit}, 'Submit')
          ])
        ])
      )
    }
  }

  var editor = {
    oninit: function(vnode) {
      var state = vnode.state;

      state.initEditor = function(targetVnode) {
        state.editable = new MediumEditor(targetVnode.dom);
        state.editable.setContent(content);
      }
    },
    view: function(vnode) {
      return(
        m('.container', [
          m('.main_container', [
            m('form', [
              m('.form-group', [
                m('input[type="text"].form-control.post-title', {
                  placeholder: 'Title', value: title,
                  oninput: m.withAttr('value', function(v) { title = v })
                })
              ]),
              m('.form-group', [
                m('#editor', {oncreate: vnode.state.initEditor, oninput: function(v) {
                  content = vnode.state.editable.getContent()
                }})
              ])
            ])
          ])
        ])
      )
    }
  }

  m.mount(document.getElementById('main'), {
    view: function(vnode) {
      return[
        m(toolbar),
        m(editor)
      ]
    }
  });
}
