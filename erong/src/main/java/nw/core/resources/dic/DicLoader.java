package nw.core.resources.dic;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import nw.core.resources.XMLHelper;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DicLoader {
	
	private static final Logger log = LoggerFactory.getLogger(DicLoader.class);

	private static Map<String, Dictionary> store = new ConcurrentHashMap<>();

	public static Dictionary get(String dicId) {
		if (store.containsKey(dicId)) {
			return store.get(dicId);
		}
		try {
			InputStream is = DicLoader.class.getClassLoader().getResourceAsStream("dic/" + dicId + ".xml");
			Document doc = XMLHelper.getDocument(is);
			Element root = doc.getRootElement();
			String cls = root.attributeValue("class", "SimpleDictionary");
			Dictionary dic = (Dictionary) Class.forName("nw.core.resources.dic." + cls).newInstance();
			dic.init(doc);
			store.put(dicId, dic);
			return dic;
		} catch (Exception e) {
			log.error("load dic {} failed", dicId);
		}

		return null;
	}

	public static void main(String[] args) throws DocumentException, IOException {
		System.out.println(get("accountType"));
	}

}
