package com.example.dobaron;

//import android.app.Activity;
import org.apache.cordova.DroidGap;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.view.KeyEvent;

public class MainActivity extends DroidGap {
    /** Called when the activity is first created. */

	
	
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		//�����ư �������� �� ���� ��Ű�� ���� ������
		if(keyCode ==KeyEvent.KEYCODE_BACK){
			finish();
			return true;
		}
		return super.onKeyDown(keyCode, event);
	}
   /* private void confirmAppExit() {
		AlertDialog.Builder db = new AlertDialog.Builder(this);
		db.setTitle(R.string.exit_app_title)
		.setMessage(R.string.exit_app_message)//"���α׷� �����ҷ�?"
		.setCancelable(true)
		.setPositiveButton(android.R.string.ok,new OnClickListener(){
			public void onClick(DialogInterface dialog,int which){
				finish();//Ȯ�ι�ư ������ ����
			}
			
		})
		.setNegativeButton(android.R.string.cancel,null)
		.show();
		
	}*/
	
	public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
       // setContentView(R.layout.main);
        
      //Android TelephonyManager �ʱ�ȭ

        TelephonyManager tm = null ;

        //TelephonyManager �ý��ۼ��� �����
        tm=(TelephonyManager)getSystemService(Context.TELEPHONY_SERVICE);

        //	�޴��� �������� �޴�����ȣ�� userPhone �� ����
        String userPhone = tm.getLine1Number();
       // super.loadUrl("http://poncoo.com/janghwan.jsp?userPhone="+userPhone);
        super.loadUrl("file:///android_asset/www/code128.html?userPhone="+userPhone);
        
       //���߿� ����ȣ�� ��ȣȭ ���Ѽ� �����ֱ� �ٶ��� ��ŷ ���ؿ� ~  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //�ܺ������� ���� �κ�
        
    }
}