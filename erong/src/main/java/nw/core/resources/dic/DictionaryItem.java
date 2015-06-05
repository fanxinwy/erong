package nw.core.resources.dic;

public class DictionaryItem {
	
	private String key;
	private String text;
	
	public DictionaryItem() {
		
	}
	
	public DictionaryItem(String key, String text) {
		this.key = key;
		this.text = text;
	}
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	

}
