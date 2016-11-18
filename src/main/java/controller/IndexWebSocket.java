package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.Cookie;

import java.io.IOException;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import model.CountDown;

@ServerEndpoint("/indexWebSocket")
public class IndexWebSocket extends HttpServlet {

  @OnMessage
  public void onMessage(String value, Session session) throws IOException, InterruptedException {
    String[] idsAndValue = value.split(";");
    int length = idsAndValue.length;
    String[] ids = new String[length];
    CountDown[] countdowns = new CountDown[length];
    for (int i=0; i<length; i++) {
      String[] separation = idsAndValue[i].split("@");
      ids[i] = separation[0];
      countdowns[i] = new CountDown(separation[1]);
    }

    // Sending message to client each 1 second
    while(true) {
        session.getBasicRemote().sendText(toJSON(ids, countdowns, length));
        Thread.sleep(1000);
    }
  }

  @OnOpen
  public void onOpen() {

  }

  @OnClose
  public void onClose() {

  }

  private String toJSON(String[] ids, CountDown[] countdowns, int length) {
    String json ="{";
    for(int i=0; i<length-1; i++) {
      json += "\""+ids[i]+"\": \""+countdowns[i].diff()+"\",";
    }
    if(length != 0) {
      json += "\""+ids[length-1]+"\": \""+countdowns[length-1].diff()+"\"";
    }
    json += "}";
    return json;
  }
}
