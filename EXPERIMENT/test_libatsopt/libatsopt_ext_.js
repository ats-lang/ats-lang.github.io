//
var
libatsopt_ext_js = "";
//
var _ =
(
function
libatsopt_ext_js_get()
{
//
$.getScript
(
"./libatsopt_ext.js"
,
function
(
  data, textStatus, jqxhr
) {
  libatsopt_ext_js = data;
/*
  console.log( data ); // Data returned
  console.log( textStatus ); // Success
  console.log( jqxhr.status ); // 200
  console.log( "Load was performed." );
*/
} // function
)
//
return;
}
)(/*libatsopt_ext_js_get*/);
//
var DELTA = 100;
//
function
libatsopt_ext_js_eval
  (total)
{
  if (libatsopt_ext_js)
  {
    return eval(libatsopt_ext_js);
  } else {
    if (total > 0) {
      setTimeout(function(){return libatsopt_ext_js_eval(total-DELTA);}, DELTA)
    } ; return /*void*/ ;
  }
}
//
/* ****** ****** */

/* end of [libatsopt_ext_.js] */
