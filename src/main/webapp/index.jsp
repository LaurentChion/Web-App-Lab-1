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
    <style>
      body {
          background-image: url("background.jpg");
      }
    </style>

  </head>


  <body>
    <div class="small-12 columns">
      <h1>Welcome to CountDown !</h1>
    </div>

    <div class="small-12 columns">
      <p>With this countdown app you can manage alarm without any subscribtion ! :)</p>
    </div>

    <div class="medium-8 columns">
      <%@ page import="javax.servlet.http.Cookie" %>
      <%
      Cookie[] cookies = request.getCookies();
      //TODO: Parcourir les cookies
      if (cookies != null) {

      for (int i=0; i< cookies.length ; i++) { %>
        <div class="row success callout">
          <div class="large-4 medium-4 columns">
            <% out.println(cookies[i].getName()); %>
          </div>
          <div class="large-6 medium-6 columns">

          <jsp:include page="WEB-INF/CountDownView.jsp"/>

          </div>
          <div class="large-2 medium-2 columns">
            <!-- TODO: Implémenter Edition et Suppression -->
              <button type="submit" class="button"><i class="fi-pencil"></i></button>

              <button type="submit" class="alert button"><i class="fi-x"></i></button>
          </div>
        </div>
      <%  }
    } else {%>
      <div class="row success callout">
        <div class="small-12 columns">
          No CountDown available
        </div>
      </div>
    <% } %>
    </div>


    <div class="medium-4 columns">
      <ul class="menu vertical secondary callout">
        <li class="title">Add a new CountDown !</li>
          <form method="POST" action="countdown">
            <li>
              <div class="row">
                <div class="small-3 columns">
                  <label for="middle-label" class="middle">Title</label>
                </div>
                <div class="small-9 columns">
                  <input type="text" name="title" placeholder="Enter title of countdown">
                </div>
              </div>
            </li>

            <li>
              <div class="row">
                <div class="small-3 columns">
                  <label for="middle-label" class="middle">Date</label>
                </div>

                <div class="small-9 columns">
                  <div class="input-group">
                    <span class="input-group-label"><i class="fi-calendar"></i></span>
                    <input class="input-group-field" name="time" type="text" value="Select a date" id="dpt">
                  </div>
                </div>
              </div>
            </li>

            <li>
              <div class="row">
                <div class="small-3 columns">
                  <label for="middle-label" class="middle">Locale</label>
                </div>
                <div class="small-9 columns">
                  <select name="locale" placeholder="Select a locale">
                    <option value="en">English</option>
                    <option value="fr">Français</option>
                  </select>
                </div>
              </div>
            </li>

            <li>
              <button type="submit" class="expanded success button">Create</button>
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
        format: 'dd/mm/yyyy hh:ii:ss',
        disableDblClickSelection: true,
        language: 'en',
        pickTime: true
      });
    });
    </script>
  </body>
</html>
