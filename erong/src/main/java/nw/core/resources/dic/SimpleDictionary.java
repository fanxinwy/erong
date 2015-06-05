package nw.core.resources.dic;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.dom4j.Document;
import org.dom4j.Element;

public class SimpleDictionary implements Dictionary{
	
	private Element root;
	private Map<String, DictionaryItem> items;
	
	@SuppressWarnings("unchecked")
	@Override
	public void init(Document doc) {
		root = doc.getRootElement();
		List<Element> els = root.selectNodes("items");
		items = new ConcurrentHashMap<String, DictionaryItem>();
		for(Element el:els){
			String itemKey = el.attributeValue("key");
			items.put(itemKey, new DictionaryItem(itemKey, el.attributeValue("text", itemKey)));
		}
	}
	
	public Map<String, DictionaryItem> getItems(){
		return items;
	}

}
