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
                <%
                TreeSet<String> sortedZones = new TreeSet<>(ZoneId.getAvailableZoneIds());

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
