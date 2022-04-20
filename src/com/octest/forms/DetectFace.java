package com.octest.forms;

import java.awt.FlowLayout;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import org.opencv.core.Core;
import org.opencv.core.Mat;
import org.opencv.core.MatOfByte;
import org.opencv.core.MatOfRect;
import org.opencv.core.Point;
import org.opencv.core.Rect;
import org.opencv.core.Scalar;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.imgproc.Imgproc;
import org.opencv.objdetect.CascadeClassifier;
import org.opencv.videoio.VideoCapture;

public class DetectFace {
 
	static JFrame frame;
	static JLabel lbl;
	static ImageIcon icon;
 
	public static void main(String[] args) {
		System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
		
		MatOfByte mem = new MatOfByte();
	
		
		CascadeClassifier cascadeFaceClassifier = new CascadeClassifier("C:\\Users\\USER\\Downloads\\Programs\\4.5.4\\opencv\\build\\etc\\haarcascades\\haarcascade_frontalface_default.xml");
		
		//CascadeClassifier cascadeEyeClassifier = new CascadeClassifier("xml/haarcascade_eye.xml");
		
		//CascadeClassifier cascadeNoseClassifier = new CascadeClassifier("xml/haarcascade_mcs_nose.xml");
	    //CascadeClassifier cascadeMouthClassifier = new CascadeClassifier("OpenCV/haarcascades/haarcascade_mcs_mouth.xml"); haarcascade_mcs_mouth on 2.4.11
		
		VideoCapture videoDevice = new VideoCapture();
		videoDevice.open(0);
		if (videoDevice.isOpened()) {
			int i=0;
			int face = 0;
				initialiser();
			
			while (i<40) {		
				Mat frameCapture = new Mat();
				videoDevice.read(frameCapture);
				
				
				MatOfRect faces = new MatOfRect();
				cascadeFaceClassifier.detectMultiScale(frameCapture, faces);								
				
				for (Rect rect : faces.toArray()) {
					
					Imgproc.putText(frameCapture, "Face", new Point(rect.x,rect.y-5), 1, 2, new Scalar(0,0,255));								
					Imgproc.rectangle(frameCapture, new Point(rect.x, rect.y), new Point(rect.x + rect.width, rect.y + rect.height),
                            new Scalar(0, 255,0));
				}
				
				
				try {
					Imgcodecs.imencode(".bmp", frameCapture, mem);
	                Image im;
					im = ImageIO.read(new ByteArrayInputStream(mem.toArray()));
					BufferedImage buff = (BufferedImage) im;
				} catch (IOException e) {
					e.printStackTrace();
				}
                
				
				
//				MatOfRect eyes = new MatOfRect();
//				//cascadeEyeClassifier.detectMultiScale(frameCapture, eyes);
//				for (Rect rect : eyes.toArray()) {
//					
//					Imgproc.putText(frameCapture, "Eye", new Point(rect.x,rect.y-5), 1, 2, new Scalar(0,0,255));				
//					
//					Imgproc.rectangle(frameCapture, new Point(rect.x, rect.y), new Point(rect.x + rect.width, rect.y + rect.height),
//							new Scalar(200, 200, 100),2);
//				}
				
				
//				MatOfRect nose = new MatOfRect();
//				//cascadeNoseClassifier.detectMultiScale(frameCapture, nose);
//				for (Rect rect : nose.toArray()) {
//					
//					Imgproc.putText(frameCapture, "Nose", new Point(rect.x,rect.y-5), 1, 2, new Scalar(0,0,255));				
//					
//					Imgproc.rectangle(frameCapture, new Point(rect.x, rect.y), new Point(rect.x + rect.width, rect.y + rect.height),
//							new Scalar(50, 255, 50),2);
//				}
				
				
			   /*MatOfRect mouth = new MatOfRect();
				cascadeMouthClassifier.detectMultiScale(frameCapture, mouth);
				for (Rect rect : mouth.toArray()) {
					
					Imgproc.rectangle(frameCapture, new Point(rect.x, rect.y), new Point(rect.x + rect.width, rect.y + rect.height),
							new Scalar(129, 90, 50),2);
				}
				
				*/
				
				
				PushImage(ConvertMat2Image(frameCapture));
				System.out.println(String.format("%s yüz(FACES) ", faces.toArray().length));
				
				i = i+1;
				face = faces.toArray().length;
			}
			
			videoDevice.release();
			frame.dispose();
			
		} else {
			System.out.println("Erreur Camera");
			return ;
		}
	}
	
	public static BufferedImage ConvertMat2Image(Mat kameraVerisi) {
	
		
		MatOfByte byteMatVerisi = new MatOfByte();
		
		Imgcodecs.imencode(".jpg", kameraVerisi, byteMatVerisi);
		
		byte[] byteArray = byteMatVerisi.toArray();
		BufferedImage goruntu = null;
		try {
			InputStream in = new ByteArrayInputStream(byteArray);
			goruntu = ImageIO.read(in);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return goruntu;
	}
  	

	public static void initialiser() {
		frame = new JFrame();
		frame.setLayout(new FlowLayout());
		frame.setSize(700, 600);
		frame.setVisible(true);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	
	public static void PushImage(Image img2) {
		
		if (frame == null)
			initialiser();
		
		if (lbl != null)
			frame.remove(lbl);
		icon = new ImageIcon(img2);
		lbl = new JLabel();
		lbl.setIcon(icon);
		frame.add(lbl);
	
		frame.revalidate();
	}
}