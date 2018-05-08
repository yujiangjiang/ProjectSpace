package haoran.common.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.ss.util.CellRangeAddress;


public class ReadExcelUtil {
	
	public List<List<String>> readExcel(String path){
		List<List<String>> data = new ArrayList<List<String>>();
		data = readExcel(path, 0);
		return data;
	}
	
	public List<List<String>> readExcel(String path, int startReadLine){
		List<List<String>> data = new ArrayList<List<String>>();
		
		try {
			data = readExcelToObj(new FileInputStream(path), startReadLine);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return data;
	}
	
	public List<List<String>> readExcel(InputStream in){
		List<List<String>> data = new ArrayList<List<String>>();
		data = readExcel(in, 0);
		return data;
	}
	
	public List<List<String>> readExcel(InputStream in, int startReadLine){
		List<List<String>> data = new ArrayList<List<String>>();
		data = readExcelToObj(in, startReadLine);
		return data;
	}
	
	private List<List<String>> readExcel(Workbook wb, int sheetIndex, int startReadLine, int tailLine){
		Sheet sheet = wb.getSheetAt(sheetIndex);
		Row row = null;
		List<List<String>> data = new ArrayList<List<String>>();
		
		for(int i = startReadLine; i < sheet.getLastRowNum()-tailLine+1; i++){
			row=sheet.getRow(i);
			List<String> rowList = new ArrayList<String>();
			for(int j = 0; j<row.getLastCellNum();j++){
				Cell c = row.getCell(j);
				if(c==null){
					rowList.add("");
					continue;
				}
				boolean isMerge = isMergeRegion(sheet, i, c.getColumnIndex());
				if(isMerge){
					try{
						String rs=getMergedRegionValue(sheet, row.getRowNum(), c.getColumnIndex());
						rowList.add(rs);
					}catch(Exception e){
						
					}
				}
			}
			data.add(rowList);
		}
		
		return data;
	}
	
	public String getMergedRegionValue(Sheet sheet, int row, int column){
		int sheetMergeCount = sheet.getNumMergedRegions();
		for(int i=0; i<sheetMergeCount; i++){
			CellRangeAddress ca = sheet.getMergedRegion(i);
			if(ca!=null){
				int firstColumn = ca.getFirstColumn();
				int lastColumn = ca.getLastColumn();
				int firstRow=ca.getFirstRow();
				int lastRow = ca.getLastRow();
				
				if(row>=firstRow && column <= lastColumn){
					Row fRow = sheet.getRow(firstRow);
					Cell fCell = fRow.getCell(firstColumn);
					return fCell.getRichStringCellValue()+"";
				}
			}
		}
		return null;
	}
	
	private List<List<String>> readExcelToObj(InputStream in, int startReadLine){
		List<List<String>> data = new ArrayList<List<String>>();
		Workbook wb = null;
		
		try {
			wb = WorkbookFactory.create(in);
			data = readExcel(wb, 0, startReadLine, 0);
			return data;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}finally{
			if(in != null){
				try {
					in.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
	}
	
	private boolean isMergeRegion(Sheet sheet, int row, int column){
		int sheetMergeCount = sheet.getNumMergedRegions();
		for(int i =0; i<sheetMergeCount; i++){
			CellRangeAddress range = sheet.getMergedRegion(i);
			if(range != null){
				int firstColumn = range.getFirstColumn();
				int lastColumn = range.getLastColumn();
				int firstRow=range.getFirstRow();
				int lastRow = range.getLastRow();
				if(row >= firstRow && row<= lastRow){
					if(column >= firstColumn && column <= lastColumn){
						return true;
					}
				}
			}
		}
		return false;
	}
	
	private boolean hasMerged(Sheet sheet){
		return sheet.getNumMergedRegions()>0 ?true:false;
	}
	private void mergeRegion(Sheet sheet, int firstRow, int lastRow, int firstCol, int lastCol){
		sheet.addMergedRegion(new CellRangeAddress(firstRow,lastRow,firstCol,lastCol));
	}
	
	public String getCellValue(Cell cell){
		if(cell ==null){
			return "";
		}
		if(cell.getCellType() ==cell.CELL_TYPE_STRING){
			return cell.getStringCellValue();
		}else if(cell.getCellType() == cell.CELL_TYPE_BOOLEAN){
			return String.valueOf(cell.getBooleanCellValue());
		}else if(cell.getCellType() == cell.CELL_TYPE_NUMERIC){
			return String.valueOf(cell.getNumericCellValue());
		}else if(cell.getCellType() == cell.CELL_TYPE_FORMULA){
			return cell.getCellFormula();
		}
		return "";
	}
}
