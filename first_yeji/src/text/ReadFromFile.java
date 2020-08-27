package text;
import java.io.*;
import java.util.ArrayList;
import java.util.Collections;
public class ReadFromFile {
	public static void main(String args[]) {
		BufferedReader bReader = null;
		int cnt=0;
		try {
			String s;
			String b;
			File file = new File("C:\\JSP_yeji\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\first_yeji\\admin\\book\\º° Çì´Â ¹ã.txt");
			bReader = new BufferedReader(new FileReader(file));

			while((s = bReader.readLine()) != null) {
				System.out.println(s);
				cnt++;
			}
			System.out.println(cnt);
			int count=cnt/15+1;
			System.out.println(count);
			System.out.println("-------");
			String [][] A = new String [count][15];
			bReader = new BufferedReader(new FileReader(file));
			while((b = bReader.readLine()) != null) {
				System.out.println(A[0][0]);
				for (int j = 0; j <count; j++) {
					for (int i = 0; i < 15; i++) {
						A[j][i]=bReader.readLine();
						System.out.println(A[j][i]);
					}
				}
				for(int x=0; x <count; x++) {
					A[x][0]=b;}

			}
			System.out.println("===++++");
			int coo=0;
			ArrayList<String[]> list3 = new ArrayList<String[]>();  
			for(int i=0; i<A.length; i++)  {                      
					list3.add(
							new String[]{A[i][0], A[i][1], A[i][3],A[i][4], A[i][5], A[i][6],A[i][7], A[i][8], A[i][9],A[i][10], A[i][11], A[i][12],A[i][13],A[i][14]}
							);
				}
			for(int i=0; i<list3.size(); i++)
			{ 
				for (int j = 0; j <13; j++) {
					System.out.println( list3.get(i)[j]+" "+coo);
					coo++;
				}
				
			System.out.println("====");}
		} catch(IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(bReader != null) bReader.close();
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
	}

}


