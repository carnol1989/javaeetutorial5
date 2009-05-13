package com.baosight.tools;



import java.util.Calendar;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;

public class MSWordManager {
	 // word�ĵ�
	 private Dispatch doc;

	 // word���г������
	 private ActiveXComponent word;

	 // ����word�ĵ�����
	 private Dispatch documents;

	 // ѡ���ķ�Χ������
	 private Dispatch selection;
	 

	 private boolean saveOnExit = true;

	 public static String APPLYBODY="������(��λ������)";
	 public static String APPLYNOTE="��������";
	 public static String APPLYNO="�����";
	 public static String RECEIVEDATE="�ռ�����";
	 public static String RECEIVER="�ռ���";
	 public static String TEL="��ϵ�绰";
	 public static String SIGNDER="ǩ����";
	 public static String SIGNDATE="ǩ��ʱ��";
	 public MSWordManager() {
	  if (word == null) {
	   word = new ActiveXComponent("Word.Application");
	   word.setProperty("Visible", new Variant(false));
	  }
	  if (documents == null)
	   documents = word.getProperty("Documents").toDispatch();
	 }

	 /**
	  * �����˳�ʱ����
	  * 
	  * @param saveOnExit
	  *            boolean true-�˳�ʱ�����ļ���false-�˳�ʱ�������ļ�
	  */
	 public void setSaveOnExit(boolean saveOnExit) {
	  this.saveOnExit = saveOnExit;
	 }

	 /**
	  * ����һ���µ�word�ĵ�
	  * 
	  */
	 public void createNewDocument() {
	  doc = Dispatch.call(documents, "Add").toDispatch();
	  selection = Dispatch.get(word, "Selection").toDispatch();
	 }

	 /**
	  * ��һ���Ѵ��ڵ��ĵ�
	  * 
	  * @param docPath
	  */
	 public void openDocument(String docPath) {
	  closeDocument();
	  doc = Dispatch.call(documents, "Open", docPath).toDispatch();
	  selection = Dispatch.get(word, "Selection").toDispatch();
	 }

	 /**
	  * ��ѡ�������ݻ����������ƶ�
	  * 
	  * @param pos
	  *            �ƶ��ľ���
	  */
	 public void moveUp(int pos) {
	  if (selection == null)
	   selection = Dispatch.get(word, "Selection").toDispatch();
	  for (int i = 0; i < pos; i++)
	   Dispatch.call(selection, "MoveUp");

	 }

	 /**
	  * ��ѡ�������ݻ��߲���������ƶ�
	  * 
	  * @param pos
	  *            �ƶ��ľ���
	  */
	 public void moveDown(int pos) {
	  if (selection == null)
	   selection = Dispatch.get(word, "Selection").toDispatch();
	  for (int i = 0; i < pos; i++)
	   Dispatch.call(selection, "MoveDown");
	 }

	 /**
	  * ��ѡ�������ݻ��߲���������ƶ�
	  * 
	  * @param pos
	  *            �ƶ��ľ���
	  */
	 public void moveLeft(int pos) {
	  if (selection == null)
	   selection = Dispatch.get(word, "Selection").toDispatch();
	  for (int i = 0; i < pos; i++) {
	   Dispatch.call(selection, "MoveLeft");
	  }
	 }

	 /**
	  * ��ѡ�������ݻ��߲���������ƶ�
	  * 
	  * @param pos
	  *            �ƶ��ľ���
	  */
	 public void moveRight(int pos) {
	  if (selection == null)
	   selection = Dispatch.get(word, "Selection").toDispatch();
	  for (int i = 0; i < pos; i++)
	   Dispatch.call(selection, "MoveRight");
	 }

	 /**
	  * �Ѳ�����ƶ����ļ���λ��
	  * 
	  */
	 public void moveStart() {
	  if (selection == null)
	   selection = Dispatch.get(word, "Selection").toDispatch();
	  Dispatch.call(selection, "HomeKey", new Variant(6));
	 }

	 /**
	  * ��ѡ�����ݻ����㿪ʼ�����ı�
	  * 
	  * @param toFindText
	  *            Ҫ���ҵ��ı�
	  * @return boolean true-���ҵ���ѡ�и��ı���false-δ���ҵ��ı�
	  */
	 public boolean find(String toFindText) {
	  if (toFindText == null || toFindText.equals(""))
	   return false;
	  // ��selection����λ�ÿ�ʼ��ѯ
	  Dispatch find = word.call(selection, "Find").toDispatch();
	  // ����Ҫ���ҵ�����
	  Dispatch.put(find, "Text", toFindText);
	  // ��ǰ����
	  Dispatch.put(find, "Forward", "True");
	  // ���ø�ʽ
	  Dispatch.put(find, "Format", "True");
	  // ��Сдƥ��
	  Dispatch.put(find, "MatchCase", "True");
	  // ȫ��ƥ��
	  Dispatch.put(find, "MatchWholeWord", "True");
	  // ���Ҳ�ѡ��
	  return Dispatch.call(find, "Execute").getBoolean();
	 }

	 /**
	  * ��ѡ��ѡ�������趨Ϊ�滻�ı�
	  * 
	  * @param toFindText
	  *            �����ַ���
	  * @param newText
	  *            Ҫ�滻������
	  * @return
	  */
	 public boolean replaceText(String toFindText, String newText) {
	  if (!find(toFindText))
	   return false;
	  Dispatch.put(selection, "Text", newText);
	  return true;
	 }

	 /**
	  * ȫ���滻�ı�
	  * 
	  * @param toFindText
	  *            �����ַ���
	  * @param newText
	  *            Ҫ�滻������
	  */
	 public void replaceAllText(String toFindText, String newText) {
	  while (find(toFindText)) {
	   Dispatch.put(selection, "Text", newText);
	   Dispatch.call(selection, "MoveRight");
	  }
	 }

	 /**
	  * �ڵ�ǰ���������ַ���
	  * 
	  * @param newText
	  *            Ҫ��������ַ���
	  */
	 public void insertText(String newText) {
	  Dispatch.put(selection, "Text", newText);
	 }

	 /**
	  * 
	  * @param toFindText
	  *            Ҫ���ҵ��ַ���
	  * @param imagePath
	  *            ͼƬ·��
	  * @return
	  */
	 public boolean replaceImage(String toFindText, String imagePath) {
	  if (!find(toFindText))
	   return false;
	  Dispatch.call(Dispatch.get(selection, "InLineShapes").toDispatch(),
	    "AddPicture", imagePath);
	  return true;
	 }

	 /**
	  * ȫ���滻ͼƬ
	  * 
	  * @param toFindText
	  *            �����ַ���
	  * @param imagePath
	  *            ͼƬ·��
	  */
	 public void replaceAllImage(String toFindText, String imagePath) {
	  while (find(toFindText)) {
	   Dispatch.call(Dispatch.get(selection, "InLineShapes").toDispatch(),
	     "AddPicture", imagePath);
	   Dispatch.call(selection, "MoveRight");
	  }
	 }

	 /**
	  * �ڵ�ǰ��������ͼƬ
	  * 
	  * @param imagePath
	  *            ͼƬ·��
	  */
	 public void insertImage(String imagePath) {
	  Dispatch.call(Dispatch.get(selection, "InLineShapes").toDispatch(),
	    "AddPicture", imagePath);
	 }

	 /**
	  * �ϲ���Ԫ��
	  * 
	  * @param tableIndex
	  * @param fstCellRowIdx
	  * @param fstCellColIdx
	  * @param secCellRowIdx
	  * @param secCellColIdx
	  */
	 public void mergeCell(int tableIndex, int fstCellRowIdx, int fstCellColIdx,
	   int secCellRowIdx, int secCellColIdx) {
	  // ���б��
	  Dispatch tables = Dispatch.get(doc, "Tables").toDispatch();
	  // Ҫ���ı��
	  Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex))
	    .toDispatch();
	  Dispatch fstCell = Dispatch.call(table, "Cell",
	    new Variant(fstCellRowIdx), new Variant(fstCellColIdx))
	    .toDispatch();
	  Dispatch secCell = Dispatch.call(table, "Cell",
	    new Variant(secCellRowIdx), new Variant(secCellColIdx))
	    .toDispatch();
	  Dispatch.call(fstCell, "Merge", secCell);
	 }

	 /**
	  * ��ָ���ĵ�Ԫ������д����
	  * 
	  * @param tableIndex
	  * @param cellRowIdx
	  * @param cellColIdx
	  * @param txt
	  */
	 public void putTxtToCell(int tableIndex, int cellRowIdx, int cellColIdx,
	   String txt) {
	  // ���б��
	  Dispatch tables = Dispatch.get(doc, "Tables").toDispatch();
	  // Ҫ���ı��
	  Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex))
	    .toDispatch();
	  Dispatch cell = Dispatch.call(table, "Cell", new Variant(cellRowIdx),
	    new Variant(cellColIdx)).toDispatch();
	  Dispatch.call(cell, "Select");
	  Dispatch.put(selection, "Text", txt);
	 }
	 /**
	  * �ڵ�ǰ�ĵ���������������
	  * @param pos
	  */
	    public void pasteExcelSheet(String pos){
	     moveStart();
	     if (this.find(pos)) {
	   Dispatch textRange = Dispatch.get(selection, "Range").toDispatch();
	   Dispatch.call(textRange, "Paste");
	  }
	    }
	    
	 /**
	  * �ڵ�ǰ�ĵ�ָ����λ�ÿ������
	  * 
	  * @param pos
	  *            ��ǰ�ĵ�ָ����λ��
	  * @param tableIndex
	  *            �������ı����word�ĵ���������λ��
	  */
	 public void copyTable(String pos, int tableIndex) {
	  // ���б��
	  Dispatch tables = Dispatch.get(doc, "Tables").toDispatch();
	  // Ҫ���ı��
	  Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex))
	    .toDispatch();
	  Dispatch range = Dispatch.get(table, "Range").toDispatch();
	  Dispatch.call(range, "Copy");
	  if (this.find(pos)) {
	   Dispatch textRange = Dispatch.get(selection, "Range").toDispatch();
	   Dispatch.call(textRange, "Paste");
	  }
	 }

	 /**
	  * �ڵ�ǰ�ĵ�ָ����λ�ÿ���������һ���ĵ��еı��
	  * 
	  * @param anotherDocPath
	  *            ��һ���ĵ��Ĵ���·��
	  * @param tableIndex
	  *            �������ı������һ���ĵ��е�λ��
	  * @param pos
	  *            ��ǰ�ĵ�ָ����λ��
	  */
	 public void copyTableFromAnotherDoc(String anotherDocPath, int tableIndex,
	   String pos) {
	  Dispatch doc2 = null;
	  try {
	   doc2 = Dispatch.call(documents, "Open", anotherDocPath)
	     .toDispatch();
	   // ���б��
	   Dispatch tables = Dispatch.get(doc2, "Tables").toDispatch();
	   // Ҫ���ı��
	   Dispatch table = Dispatch.call(tables, "Item",
	     new Variant(tableIndex)).toDispatch();
	   Dispatch range = Dispatch.get(table, "Range").toDispatch();
	   Dispatch.call(range, "Copy");
	   if (this.find(pos)) {
	    Dispatch textRange = Dispatch.get(selection, "Range").toDispatch();
	    Dispatch.call(textRange, "Paste");
	   }
	  } catch (Exception e) {
	   e.printStackTrace();
	  } finally {
	   if (doc2 != null) {
	    Dispatch.call(doc2, "Close", new Variant(saveOnExit));
	    doc2 = null;
	   }
	  }
	 }
	 /**
	  * �ڵ�ǰ�ĵ�ָ����λ�ÿ���������һ���ĵ��е�ͼƬ
	  * @param anotherDocPath ��һ���ĵ��Ĵ���·��
	  * @param shapeIndex ��������ͼƬ����һ���ĵ��е�λ��
	  * @param pos ��ǰ�ĵ�ָ����λ��
	  */
	    public void copyImageFromAnotherDoc(String anotherDocPath,int shapeIndex,String pos){
	     Dispatch doc2 = null;
	  try {
	   doc2 = Dispatch.call(documents, "Open", anotherDocPath)
	     .toDispatch();
	   Dispatch shapes = Dispatch.get(doc2, "InLineShapes").toDispatch();
	   Dispatch shape = Dispatch.call(shapes, "Item", new Variant(shapeIndex)).toDispatch();
	   Dispatch imageRange = Dispatch.get(shape, "Range").toDispatch();
	   Dispatch.call(imageRange, "Copy");
	   if (this.find(pos)) {
	    Dispatch textRange = Dispatch.get(selection, "Range").toDispatch();
	    Dispatch.call(textRange, "Paste");
	   }
	  } catch (Exception e) {
	   e.printStackTrace();
	  } finally {
	   if (doc2 != null) {
	    Dispatch.call(doc2, "Close", new Variant(saveOnExit));
	    doc2 = null;
	   }
	  }
	    }
	 /**
	  * �������
	  * 
	  * @param pos
	  *            λ��
	  * @param cols
	  *            ����
	  * @param rows
	  *            ����
	  */
	 public void createTable(String pos, int numCols, int numRows) {
	  if (find(pos)) {
	   Dispatch tables = Dispatch.get(doc, "Tables").toDispatch();
	   Dispatch range = Dispatch.get(selection, "Range").toDispatch();
	   Dispatch newTable = Dispatch.call(tables, "Add", range,
	     new Variant(numRows), new Variant(numCols)).toDispatch();
	   Dispatch.call(selection, "MoveRight");
	  }
	 }

	 /**
	  * ��ָ����ǰ��������
	  * 
	  * @param tableIndex
	  *            word�ļ��еĵ�N�ű�(��1��ʼ)
	  * @param rowIndex
	  *            ָ���е����(��1��ʼ)
	  */
	 public void addTableRow(int tableIndex, int rowIndex) {
	  // ���б��
	  Dispatch tables = Dispatch.get(doc, "Tables").toDispatch();
	  // Ҫ���ı��
	  Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex))
	    .toDispatch();
	  // ����������
	  Dispatch rows = Dispatch.get(table, "Rows").toDispatch();
	  Dispatch row = Dispatch.call(rows, "Item", new Variant(rowIndex))
	    .toDispatch();
	  Dispatch.call(rows, "Add", new Variant(row));
	 }

	 /**
	  * �ڵ�1��ǰ����һ��
	  * 
	  * @param tableIndex
	  *  word�ĵ��еĵ�N�ű�(��1��ʼ)
	  */
	 public void addFirstTableRow(int tableIndex) {
	  // ���б��
	  Dispatch tables = Dispatch.get(doc, "Tables").toDispatch();
	  // Ҫ���ı��
	  Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex))
	    .toDispatch();
	  // ����������
	  Dispatch rows = Dispatch.get(table, "Rows").toDispatch();
	  Dispatch row = Dispatch.get(rows, "First").toDispatch();
	  Dispatch.call(rows, "Add", new Variant(row));
	 }

	 /**
	  * �����1��ǰ����һ��
	  * 
	  * @param tableIndex
	  *            word�ĵ��еĵ�N�ű�(��1��ʼ)
	  */
	 public void addLastTableRow(int tableIndex) {
	  // ���б��
	  Dispatch tables = Dispatch.get(doc, "Tables").toDispatch();
	  // Ҫ���ı��
	  Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex))
	    .toDispatch();
	  // ����������
	  Dispatch rows = Dispatch.get(table, "Rows").toDispatch();
	  Dispatch row = Dispatch.get(rows, "Last").toDispatch();
	  Dispatch.call(rows, "Add", new Variant(row));
	 }

	 /**
	  * ����һ��
	  * 
	  * @param tableIndex
	  *            word�ĵ��еĵ�N�ű�(��1��ʼ)
	  */
	 public void addRow(int tableIndex) {
	  Dispatch tables = Dispatch.get(doc, "Tables").toDispatch();
	  // Ҫ���ı��
	  Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex))
	    .toDispatch();
	  // ����������
	  Dispatch rows = Dispatch.get(table, "Rows").toDispatch();
	  Dispatch.call(rows, "Add");
	 }

	 /**
	  * ����һ��
	  * 
	  * @param tableIndex
	  *            word�ĵ��еĵ�N�ű�(��1��ʼ)
	  */
	 public void addCol(int tableIndex) {
	  // ���б��
	  Dispatch tables = Dispatch.get(doc, "Tables").toDispatch();
	  // Ҫ���ı��
	  Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex))
	    .toDispatch();
	  // ����������
	  Dispatch cols = Dispatch.get(table, "Columns").toDispatch();
	  Dispatch.call(cols, "Add").toDispatch();
	  Dispatch.call(cols, "AutoFit");
	 }

	 /**
	  * ��ָ����ǰ�����ӱ�����
	  * 
	  * @param tableIndex
	  *            word�ĵ��еĵ�N�ű�(��1��ʼ)
	  * @param colIndex
	  *            �ƶ��е���� (��1��ʼ)
	  */
	 public void addTableCol(int tableIndex, int colIndex) {
	  // ���б��
	  Dispatch tables = Dispatch.get(doc, "Tables").toDispatch();
	  // Ҫ���ı��
	  Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex))
	    .toDispatch();
	  // ����������
	  Dispatch cols = Dispatch.get(table, "Columns").toDispatch();
	  System.out.println(Dispatch.get(cols, "Count"));
	  Dispatch col = Dispatch.call(cols, "Item", new Variant(colIndex))
	    .toDispatch();
	  // Dispatch col = Dispatch.get(cols, "First").toDispatch();
	  Dispatch.call(cols, "Add", col).toDispatch();
	  Dispatch.call(cols, "AutoFit");
	 }

	 /**
	  * �ڵ�1��ǰ����һ��
	  * 
	  * @param tableIndex
	  *            word�ĵ��еĵ�N�ű�(��1��ʼ)
	  */
	 public void addFirstTableCol(int tableIndex) {
	  Dispatch tables = Dispatch.get(doc, "Tables").toDispatch();
	  // Ҫ���ı��
	  Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex))
	    .toDispatch();
	  // ����������
	  Dispatch cols = Dispatch.get(table, "Columns").toDispatch();
	  Dispatch col = Dispatch.get(cols, "First").toDispatch();
	  Dispatch.call(cols, "Add", col).toDispatch();
	  Dispatch.call(cols, "AutoFit");
	 }

	 /**
	  * �����һ��ǰ����һ��
	  * 
	  * @param tableIndex
	  *            word�ĵ��еĵ�N�ű�(��1��ʼ)
	  */
	 public void addLastTableCol(int tableIndex) {
	  Dispatch tables = Dispatch.get(doc, "Tables").toDispatch();
	  // Ҫ���ı��
	  Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex))
	    .toDispatch();
	  // ����������
	  Dispatch cols = Dispatch.get(table, "Columns").toDispatch();
	  Dispatch col = Dispatch.get(cols, "Last").toDispatch();
	  Dispatch.call(cols, "Add", col).toDispatch();
	  Dispatch.call(cols, "AutoFit");
	 }
	 /**
	  * �Զ��������
	  *
	  */
	   /* public void autoFitTable(){
	     Dispatch tables = Dispatch.get(doc, "Tables").toDispatch();
	     int count = Dispatch.get(tables, "Count").toInt();
	     for(int i=0;i       Dispatch table = Dispatch.call(tables, "Item", new Variant(i+1))
	   .toDispatch();
	      Dispatch cols = Dispatch.get(table, "Columns").toDispatch();
	      Dispatch.call(cols, "AutoFit");
	     }
	    }*/
	    /**
	     * ����word��ĺ��Ե������Ŀ��,���к걣����document��
	     *
	     */
	    /*public void callWordMacro(){
	     Dispatch tables = Dispatch.get(doc, "Tables").toDispatch();
	     int count = Dispatch.get(tables, "Count").toInt();
	     Variant vMacroName = new Variant("Normal.NewMacros.tableFit");
	     Variant vParam = new Variant("param1");
	     Variant para[]=new Variant[]{vMacroName};
	     for(int i=0;i       Dispatch table = Dispatch.call(tables, "Item", new Variant(i+1))
	   .toDispatch();
	      Dispatch.call(table, "Select");
	      Dispatch.call(word,"Run","tableFitContent");
	     } 
	    }*/
	 /**
	  * ���õ�ǰѡ�����ݵ�����
	  * 
	  * @param boldSize
	  * @param italicSize
	  * @param underLineSize
	  *            �»���
	  * @param colorSize
	  *            ������ɫ
	  * @param size
	  *            �����С
	  * @param name
	  *            ��������
	  */
	 public void setFont(boolean bold, boolean italic, boolean underLine,
	   String colorSize, String size, String name) {
	  Dispatch font = Dispatch.get(selection, "Font").toDispatch();
	  Dispatch.put(font, "Name", new Variant(name));
	  Dispatch.put(font, "Bold", new Variant(bold));
	  Dispatch.put(font, "Italic", new Variant(italic));
	  Dispatch.put(font, "Underline", new Variant(underLine));
	  Dispatch.put(font, "Color", colorSize);
	  Dispatch.put(font, "Size", size);
	 }

	 /**
	  * �ļ���������Ϊ
	  * 
	  * @param savePath
	  *            ��������Ϊ·��
	  */
	 public void save(String savePath) {
		 Dispatch.call(doc, "SaveAs",savePath); //����
	 /* Dispatch.call(Dispatch.call(word, "WordBasic").getDispatch(),
	    "FileSaveAs", savePath);*/
	 }

	 /**
	  * �رյ�ǰword�ĵ�
	  * 
	  */
	 public void closeDocument() {
	  if (doc != null) {
	   Dispatch.call(doc, "Save");
	   Dispatch.call(doc, "Close", new Variant(saveOnExit));
	   doc = null;
	  }
	 }

	 /**
	  * �ر�ȫ��Ӧ��
	  * 
	  */
	 public void close() {
	  closeDocument();
	  if (word != null) {
	   Dispatch.call(word, "Quit");
	   word = null;
	  }
	  selection = null;
	  documents = null;
	 }

	 /**
	  * ��ӡ��ǰword�ĵ�
	  * 
	  */
	 public void printFile() {
	  if (doc != null) {
	   Dispatch.call(doc, "PrintOut");
	  }
	 }
	 /**
	  * ɾ��һ��
	  * 
	  * @param tableIndex
	  *            word�ĵ��еĵ�N�ű�(��1��ʼ)
	  */
	 public void delRow(int tableIndex) {
	  Dispatch tables = Dispatch.get(doc, "Tables").toDispatch();
	  // Ҫ���ı��
	  Dispatch table = Dispatch.call(tables, "Item", new Variant(tableIndex))
	    .toDispatch();
	  // ����������
	  Dispatch rows = Dispatch.get(table, "Rows").toDispatch();
	  Object temp1 = Dispatch.get(rows, "Count");
	  String temp2 = temp1.toString();
	  int count = Integer.parseInt(temp2);
	  while(count>1){
		  Dispatch row = Dispatch.get(rows, "Last").toDispatch(); 
		  Dispatch.call(row, "Delete");
		  rows = Dispatch.get(table, "Rows").toDispatch();
		  temp1 = Dispatch.get(rows, "Count");
		  temp2 = temp1.toString();
		  count = Integer.parseInt(temp2);
	  } 
	 }	 
	 public static void main(String args[]) {
	  MSWordManager msWordManager = new MSWordManager();
	  try {
	   int year = 1900+Calendar.getInstance().getTime().getYear();
	   int month = Calendar.getInstance().getTime().getMonth()+1;
	   int day = Calendar.getInstance().getTime().getDay();
	   msWordManager.openDocument("D:\\test.doc");
	   msWordManager.moveStart();
	   if(msWordManager.find("2008")){
		   System.out.println("2008");
		   msWordManager.moveLeft(1);
		  // msWordManager.insertText("��������");
		   msWordManager.replaceText("2008", year+"");
	   }
	   msWordManager.moveStart();
	   if(msWordManager.find("����")){
		   System.out.println("����");
		   msWordManager.moveLeft(1);
		  // msWordManager.insertText("��������");
		   msWordManager.replaceText("����", "---����---");
	   }
	   
	  /* msWordManager.moveStart();
	   if(msWordManager.find(MSWordManager.APPLYBODY)){
		   System.out.println("APPLYBODY");
		   msWordManager.moveRight(1);
		   msWordManager.insertText("��������");
	   }
	   
	   msWordManager.moveStart();
	   if(msWordManager.find(MSWordManager.APPLYNOTE)){
		   System.out.println("APPLYNOTE");
		   msWordManager.moveRight(1);
		   msWordManager.insertText("���ӵ�����Χ�ڽ�����Ŀ�����");
	   }
	   
	   msWordManager.moveStart();
	   if(msWordManager.find(MSWordManager.APPLYNO)){
		   System.out.println("APPLYNO");
		   msWordManager.moveRight(1);
		   msWordManager.insertText("��1234567890abcde");
	   }

	   msWordManager.moveStart();
	   if(msWordManager.find(MSWordManager.RECEIVEDATE)){
		   System.out.println("RECEIVEDATE");
		   msWordManager.moveRight(1);
		   msWordManager.insertText("��2008-08-08");
	   }
	   
	   msWordManager.moveStart();
	   if(msWordManager.find(MSWordManager.RECEIVER)){
		   System.out.println("RECEIVER");
		   msWordManager.moveRight(1);
		   msWordManager.insertText("������һ");
	   }
	   
	   
	   msWordManager.moveStart();
	   if(msWordManager.find(MSWordManager.TEL)){
		   System.out.println("TEL");
		   msWordManager.moveRight(1);
		   msWordManager.insertText("��13809876543");
	   }
	   
	   msWordManager.moveStart();
	   if(msWordManager.find(MSWordManager.SIGNDER)){
		   System.out.println("SIGNDER");
		   msWordManager.moveRight(1);
		   msWordManager.insertText("���߳�");
	   }
	   
	   msWordManager.moveStart();
	   if(msWordManager.find(MSWordManager.SIGNDATE)){
		   System.out.println("APPLYBODY");
		   msWordManager.moveRight(1);
		   msWordManager.insertText("��2008-08-18");
	   }
	   
	   
	   
	   msWordManager.addRow(1);
	   msWordManager.putTxtToCell(1,2,1,"1");
	   msWordManager.putTxtToCell(1,2,2,"��������");
	   msWordManager.putTxtToCell(1,2,3,"1/1");
	   msWordManager.putTxtToCell(1,2,4,"2/2");
	   msWordManager.putTxtToCell(1,2,5,"��ע");

	   msWordManager.addRow(1);
	   msWordManager.putTxtToCell(1,3,1,"2");
	   msWordManager.putTxtToCell(1,3,2,"��������");
	   msWordManager.putTxtToCell(1,3,3,"1/1");
	   msWordManager.putTxtToCell(1,3,4,"2/2");
	   msWordManager.putTxtToCell(1,3,5,"��ע");
	   
	   msWordManager.addRow(1);
	   msWordManager.putTxtToCell(1,4,1,"3");
	   msWordManager.putTxtToCell(1,4,2,"��������");
	   msWordManager.putTxtToCell(1,4,3,"1/1");
	   msWordManager.putTxtToCell(1,4,4,"2/2");
	   msWordManager.putTxtToCell(1,4,5,"��ע");
	   
	   msWordManager.addRow(1);
	   msWordManager.putTxtToCell(1,5,1,"4");
	   msWordManager.putTxtToCell(1,5,2,"��������");
	   msWordManager.putTxtToCell(1,5,3,"1/1");
	   msWordManager.putTxtToCell(1,5,4,"2/2");
	   msWordManager.putTxtToCell(1,5,5,"��ע");
	   
	   msWordManager.addRow(1);
	   msWordManager.putTxtToCell(1,6,1,"5");
	   msWordManager.putTxtToCell(1,6,2,"��������");
	   msWordManager.putTxtToCell(1,6,3,"1/1");
	   msWordManager.putTxtToCell(1,6,4,"2/2");
	   msWordManager.putTxtToCell(1,6,5,"��ע");
	   msWordManager.save("D:\\1.doc");*/
	   
	   msWordManager.save("D:\\2.doc");
	  // msWordManager.callWordMacro();
	   
	  } catch (Exception e) {
	   e.printStackTrace();
	  }
	  msWordManager.close();
	 }

	}

