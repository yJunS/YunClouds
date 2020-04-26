package com.ceecloud.util;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

public class SocketUtil {
    public static String query(String ip,int port,String text){
        String str = "";
        byte byte0[] = text.getBytes();
        try {
            Socket socket = new Socket(ip,port);
            DataOutputStream dataOutputStream = new DataOutputStream(socket.getOutputStream());
            dataOutputStream.write(byte0);
            dataOutputStream.flush();
            byte byte1[] = new byte[1024];
            DataInputStream dataInputStream = new DataInputStream(socket.getInputStream());
            dataInputStream.read(byte1);
            str = new String(byte1, "gb2312");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return str;
    }
}
