import stdlib.themes.bootstrap

function select(({string id} or {autogen}) id, list('a) options, ('a -> void) callback) {
  id =
    match (id) {
    case {id: user_id}: user_id;
    case {autogen}: Dom.fresh_id()
    }
  function render_option(i, o) {
    <option value={i}>{o}</>
  }
  function changed(_evt) {
    sel_val = List.unsafe_get(String.to_int(Dom.get_value(#{id})), options);
    callback(sel_val);
  }
  <select id={id} onchange={changed}>
    {List.mapi(render_option, options)}
  </>
}

function selected(int number) {
  #selectMsg = <>You selected {number}</>
}

function page() {
  list(int) numberRange = [2, 3, 4, 5, 6, 7, 8, 9];
  <div class=container>
    <form class=form-horizontal>
      <legend>Simple selection demo with Opa</>
      <fieldset>
        <div class=control-group>
          <label class=control-label for=select01>Make your choice</>
          <div class=controls>
            {select({id: "select01"}, numberRange, selected)}
            <p id=#selectMsg class=help-block>You did not make any selection</>
          </>
        </>
      </>
    </>
  </>
}

 // simple one-page server
Server.start(Server.http, {title: "Form selection in Opa", ~page});
