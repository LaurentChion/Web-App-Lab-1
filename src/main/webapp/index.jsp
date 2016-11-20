<jsp:directive.page contentType="text/html;charset=UTF-8" />

<jsp:include page="includes/header.jsp"/>

<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.TreeSet" %>
<%@ page import="model.CountDown" %>
<%@ page import="java.time.ZoneId" %>


<div class="medium-8 columns">

  <%
  Cookie[] cookies = request.getCookies();
  ArrayList<Cookie> cookiesValide = new ArrayList<Cookie>();
  TreeSet<String> sortedZones = new TreeSet<>(ZoneId.getAvailableZoneIds());

  if (cookies != null) {
    for (int i=0; i< cookies.length ; i++) {
      if ( !((cookies[i].getName().equals("JSESSIONID")) || (cookies[i].getValue().equals("") )) ) {
        cookiesValide.add(cookies[i]);
      }
    }
    if (cookiesValide.size() == 0) {%>
      <div class="row callout">
        <div class="small-12 columns">
          No CountDown available
        </div>
      </div>
    <%}
    else {
      for (Cookie c : cookiesValide) {
        CountDown countdown = new CountDown(c.getValue());
        %>
        <div class="row callout">
          <div class="large-4 medium-4 columns">
            <%
              CountDown compteur = new CountDown(c.getValue());
              out.println(compteur.getTitle());
            %>
          </div>
          <div class="large-6 medium-6 columns">
            <div id="<% out.print(c.getName()); %>">

            </div>
          </div>
          <div class="large-2 medium-2 columns">
            <ul class="menu">

            <li><button class="button" data-open="modal<%c.getName();%>" aria-haspopup="true" class="has-tip" data-disable-hover="false" tabindex="1" title="Edit"><i class="fi-pencil"></i></button></li>

            <li><form  action="delete" method="post">
              <input type="hidden" name="id" value="<% out.print(c.getName()) ;%>">
              <button type="submit" class="alert button" aria-haspopup="true" class="has-tip" data-disable-hover="false" tabindex="1" title="Delete"><i class="fi-x"></i></button>
            </form></li>
          </ul>

            <!--Menu edition -->
            <div class="reveal" id="modal<%c.getName();%>" data-reveal>
                  <ul class="menu vertical">
                    <li class="title">Edit a CountDown !</li>
                      <form method="POST" action="edit">
                        <input type="hidden" name="id" value="<% out.print(c.getName()) ;%>">
                        <li>
                          <div class="row">
                            <div class="small-3 columns">
                              <label for="middle-label" class="middle">Title</label>
                            </div>
                            <div class="small-9 columns">
                              <input type="text" name="title" placeholder="<%out.print(countdown.getTitle());%>">
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
                                <input class="input-group-field" name="time" type="text" placeholder="<%out.print(countdown.getTime());%>" id="dpt2">
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
                              <select name="locale" placeholder="<%out.print(countdown.getLocale());%>">
                                <%
                                for (String zone : sortedZones) { %>
                                  <option value="<%out.print(zone);%>"><%out.print(zone);%></option>
                                <%
                                } %>
                              </select>
                            </div>
                          </div>
                        </li>

                        <li>
                          <button type="submit" class="expanded success button">Create</button>
                        </li>
                    </form>
                  </ul>
                <!--Fin Menu edition -->
              <button class="close-button" data-close aria-label="Close modal" type="button">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
          </div>
        </div> <%
      }
    }
  }
  else {%>
    <div class="row callout">
      <div class="small-12 columns">
        No CountDown available
      </div>
    </div>
  <% } %>
  </div>


<div class="medium-4 columns">
  <ul class="menu vertical callout">
    <li class="title">Add a new CountDown !</li>
      <form method="POST" action="add">
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
                <input class="input-group-field" name="time" type="text" placeholder="Select a date" id="dpt">
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
                <%
                for (String zone : sortedZones) { %>
                  <option value="<%out.print(zone);%>"><%out.print(zone);%></option>
                <%
                } %>
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

<jsp:include page="includes/js.jsp"/>

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

<script>
$(function(){
  $('#dpt2').fdatepicker({
    format: 'dd/mm/yyyy hh:ii:ss',
    disableDblClickSelection: true,
    language: 'en',
    pickTime: true
  });
});
</script>

<script type="text/javascript">
    var webSocket = new WebSocket(
            'ws://localhost:<%out.print(request.getServerPort());%>/CountDownWebApp/indexWebSocket');

    webSocket.onerror = function(event) {
        onError(event)
    };

    webSocket.onopen = function(event) {
        onOpen(event)
    };

    webSocket.onmessage = function(event) {
        onMessage(event)
    };

    function onMessage(event) {
        var tab = JSON.parse(event.data);

        <% for(Cookie c : cookiesValide) {%>
          document.getElementById('<%out.print(c.getName());%>').innerHTML = tab['<%out.print(c.getName());%>'];

        <% } %>
    }

    function onOpen(event) {
      start();
    }

    function onError(event) {
        alert(event.data);
    }

    function start() {
        var str = '<%
          for (int i=0; i<cookiesValide.size() - 1; i++) {
            out.print(cookiesValide.get(i).getName()+"@"+cookiesValide.get(i).getValue()+";");
          }
          if (cookiesValide.size() != 0) {
            out.print(cookiesValide.get(cookiesValide.size()-1).getName()+"@"+cookiesValide.get(cookiesValide.size()-1).getValue());
          }
         %>';
        console.log(str);
        webSocket.send(str);
        return false;
    }
</script>

<jsp:include page="includes/footer.jsp"/>
