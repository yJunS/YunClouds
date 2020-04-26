package com.ceecloud.task;

import com.ceecloud.entity.CardFormMap;
import com.ceecloud.entity.CardServerFormMap;
import com.ceecloud.entity.CardTranInfoFormMap;
import com.ceecloud.mapper.CardMapper;
import com.ceecloud.mapper.CardServerMapper;
import com.ceecloud.mapper.CardTranInfoMapper;
import com.ceecloud.util.SocketUtil;
import com.lanyuan.util.Common;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.inject.Inject;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import static com.sun.xml.internal.bind.WhiteSpaceProcessor.trim;

@Component
@Lazy(false)
public class SpringTranController {
    @Inject
    private CardMapper cardMapper;

    @Inject
    private CardTranInfoMapper cardTranInfoMapper;

    @Inject
    private CardServerMapper cardServerMapper;

    @Scheduled(cron = "0 0 1 * * ?")
    public void task(){
        List<CardFormMap> cardFormMapList = new ArrayList<CardFormMap>();
        cardFormMapList = cardMapper.findCardPage(new CardFormMap());
        DateFormat format = new SimpleDateFormat("yyyyMMdd");
        DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();//此时打印它获取的是系统当前时间
        calendar.add(Calendar.DATE, -1);    //得到前一天
        String startDate = format.format(calendar.getTime());
        String startTime = "000000";
        String endDate = format.format(new Date());
        String endTime = "000000";
        for (CardFormMap cardFormMap : cardFormMapList) {
            while (true) {
                String queryString;
                String type = "0600,";
                String packageHeader = "00000060,003010258120060,20171010,080000,000001,";
                String cardNum = cardFormMap.getStr("cardNumber");
                Boolean isOk = false;
                while (cardNum.length() < 22) {
                    cardNum = " " + cardNum;
                }
                cardNum = cardNum + ",";
                packageHeader = packageHeader + cardNum;
                String num = "99,";
                queryString = type + packageHeader + num + startDate + "," + startTime + "," + endDate + "," + endTime;
                int is = queryString.length();
                queryString = is < 10 ? "000" + is + queryString : is < 100 ? "00" + is + queryString : is < 1000 ? "0" + is + queryString : is + queryString;
                List<CardServerFormMap> cardServerFormMaps = new ArrayList<CardServerFormMap>();
                cardServerFormMaps = cardServerMapper.findCardServerPage(new CardServerFormMap());
                if(cardServerFormMaps!=null && cardServerFormMaps.size()!=0) {
                    String result = SocketUtil.query(cardServerFormMaps.get(0).getStr("ip"), cardServerFormMaps.get(0).getInt("port"), queryString);
                    String checkType = result.substring(9, result.length() - 1);
                    String checkHeader = checkType.replace(packageHeader, "");
                    String number = checkHeader.substring(0, 3);
                    String status = checkHeader.substring(4, 7);
                    String resultString = checkHeader.substring(9, checkHeader.length() - 1);
                    if (resultString.contains("|")) {
                        String[] resultMap = resultString.split("\\|");
                        for (int i = 0; i < resultMap.length; i++) {
                            String tranInfo = resultMap[i];
                            if (!Common.isEmpty(tranInfo)) {
                                String[] tranGroup = tranInfo.split(",");
                                CardTranInfoFormMap cardTranInfoFormMap = new CardTranInfoFormMap();
                                cardTranInfoFormMap.set("cardId", cardFormMap.get("id"));
                                cardTranInfoFormMap.set("merchantId", tranGroup[0]);
                                cardTranInfoFormMap.set("merchantName", tranGroup[1]);
                                cardTranInfoFormMap.set("terminalId", tranGroup[2]);
                                cardTranInfoFormMap.set("tranType", tranGroup[3]);
                                String date = "";
                                try {
                                    date = format1.format(format1.parse(format2.format(format.parse(tranGroup[4])) + " " + splitString(tranGroup[5], 2)));
                                } catch (ParseException e) {
                                    e.printStackTrace();
                                }
                                cardTranInfoFormMap.set("tranDate", date);
                                cardTranInfoFormMap.set("tranAmount", trim(tranGroup[6]));
                                cardTranInfoFormMap.set("hostTranLs", tranGroup[7]);
                                try {
                                    cardTranInfoMapper.addEntity(cardTranInfoFormMap);
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                                if (Integer.valueOf(number) == resultMap.length - 1 && i == resultMap.length - 2) {
                                    isOk = true;
                                    break;
                                } else {
                                    endDate = tranGroup[4];
                                    endTime = tranGroup[5];
                                }
                            }
                        }
                        if (isOk) {
                            break;
                        }
                    } else {
                        break;
                    }
                }
            }
        }
    }

    private static String splitString(String text,int length){
        String result = "";
        int num = text.length() / length;
        for(int i =1;i<=num;i++) {
            result += text.substring((i-1)*length,i*length) + ":";
        }
        return result.substring(0, result.length() - 1);
    }

    public static void main(String[] args) {
        String queryString ;
        String type = "0600,";
        String packageHeader = "00000060,003010258120060,20171010,080000,000001,";
        String cardNum = "1001918228000011";
        while (cardNum.length()<22){
            cardNum = " " + cardNum;
        }
        cardNum = cardNum + ",";
        packageHeader = packageHeader + cardNum;
        String num = "99,";
        DateFormat format = new SimpleDateFormat("yyyyMMdd");
        DateFormat format1 = new SimpleDateFormat("HHmmss");
        Calendar calendar = Calendar.getInstance();//此时打印它获取的是系统当前时间
        calendar.add(Calendar.DATE, -3);    //得到前一天
        queryString = type + packageHeader + num + format.format(calendar.getTime()) + ",000000," + format.format(new Date()) +"," + format1.format(new Date());
        int is = queryString.length();
        queryString = is < 10 ? "000" + is + queryString : is < 100 ? "00" + is  + queryString : is < 1000 ? "0" + is + queryString : is + queryString ;
        String s = SocketUtil.query("211.145.15.141", 6959, queryString);
        System.out.println(s);
        String abc = s.substring(9, s.length() - 1);
        System.out.println(abc);
        if (abc.contains(queryString)) {
            abc = abc.replace(queryString, "");
        }
        abc = abc.substring(9, abc.length() - 1);
        if (abc.contains("|")) {
            String[] fx = abc.split("\\|");
            for(int i=0;i<fx.length;i++) {
                System.out.println(fx[i]);
            }
        }
    }
}
