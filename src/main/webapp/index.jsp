<jsp:directive.page contentType="text/html;charset=UTF-8" />

<jsp:include page="includes/header.jsp"/>

<div class="medium-8 columns">
  <%@ page import="javax.servlet.http.Cookie" %>
  <%@ page import="your.packag.CountDown" %>
  <%
  Cookie[] cookies = request.getCookies();

  if (cookies != null) {

  for (int i=0; i< cookies.length ; i++) {
    if ( !cookies[i].getName().equals("JSESSIONID") ) {
      %>
      <div class="row success callout">
        <div class="large-4 medium-4 columns">
          <%
            CountDown c = new CountDown(cookies[i].getValue());
            out.println(c.getTitle());
          %>
        </div>
        <div class="large-6 medium-6 columns">
        <%
          out.println(c.diff());
        %>
        </div>
        <div class="large-2 medium-2 columns">
          <!-- TODO: Implémenter Edition et Suppression -->
            <button type="submit" class="button"><i class="fi-pencil"></i></button>
            <form  action="delete" method="post">
              <input type="text" name="id" value="<% out.print(cookies[i].getName()) ;%>">
              <button type="submit" class="alert button"><i class="fi-x"></i></button>
            </form>
        </div>
      </div>
    <%  }
  }
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

<jsp:include page="includes/footer.jsp"/>
