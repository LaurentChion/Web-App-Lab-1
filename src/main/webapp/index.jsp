<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html class="no-js" lang="fr" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CountDown App !</title>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.2.4/foundation.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/foundation-datepicker/1.5.5/css/foundation-datepicker.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.min.css">

  </head>
  <body>
    <div class="small-12 columns">
      <h1>Welcome to CountDown</h1>
    </div>

    <div class="small-12 columns">
      <h3>With this countdown app you can manage alarm without any subscribtion ! Just leave your computer on ;)</h3>
    </div>

    <div class="medium-8 columns">
      <%
        String str = "<div class=\"row success callout\">"
          +"<div class=\"large-4 medium-4 columns\">"
            +"Titre"
          +"</div>"
          +"<div class=\"large-4 medium-4 columns\">"
            +"Temps Restant"
          +"</div>"
          +"<div class=\"large-4 medium-4 columns\">"
            +"Boutons (Edition, Suppression)"
          +"</div>"
        +"</div>";

        for (int i=0; i< 4; i++) {
          out.println(str);
        }
      %>
    </div>

    <div class="medium-4 columns">
      <ul class="menu vertical secondary callout">
        <li class="title">Menu :</li>
          <form>
            <li>
              <div class="row">
                <div class="small-3 columns">
                  <label for="middle-label" class="text-right middle">Title</label>
                </div>
                <div class="small-9 columns">
                  <input type="text" id="middle-label" placeholder="Enter title of countdown">
                </div>
              </div>
            </li>

            <li>
              <div class="row">
                <div class="small-3 columns">
                  <label for="middle-label" class="text-right middle">Date</label>
                </div>

                <div class="small-9 columns">
                  <div class="input-group">
                    <span class="input-group-label"><i class="fi-calendar"></i></span>
                    <input class="input-group-field" type="text" value="Select a date" id="dpt">
                  </div>
                </div>
              </div>
            </li>


        </form>
      </ul>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/what-input/2.1.1/what-input.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.2.4/foundation.min.js"></script>
    <script src="js/app.js"></script>
    <script src ="https://cdnjs.cloudflare.com/ajax/libs/foundation-datepicker/1.5.5/js/foundation-datepicker.min.js"></script>

    <script>
    $(function(){
      $('#dpt').fdatepicker({
        format: 'mm-dd-yyyy hh:ii',
        disableDblClickSelection: true,
        language: 'fr',
        pickTime: true
      });
    });
    </script>
  </body>
</html>
