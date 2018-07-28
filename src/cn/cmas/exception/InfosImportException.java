package cn.cmas.exception;

public class InfosImportException extends Exception {
	private static final long serialVersionUID = 1L;
	public InfosImportException() {
		
	}
	public InfosImportException(String msg){
		super(msg);
	}
}