import stdlib.themes.bootstrap

function selectOptions(list('a) opts) {
  function render_option(o) {
    <option>{o}</>
  }
  <>{List.map(render_option, opts)}</>
}

function page() {
  list(int) numberRange = [2, 3, 4, 5, 6, 7, 8, 9]
  <div class=container>
    <form class=form-horizontal>
      <legend>Simple selection demo with Opa</>
      <fieldset>
        <div class=control-group>
          <label class=control-label for=select01>Make your choice</>
          <div class=controls>
            <select id=select01>
              {selectOptions(numberRange)}
            </>
          </>
        </>
      </>
    </>
  </>
}

 // simple one-page server
Server.start(Server.http, {title: "Form selection in Opa", ~page})
