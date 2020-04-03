import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class MyBean1 {
	
	private List<String> beanList;
	
	public List<String> deleteNull(String[] list) {
		this.beanList = new ArrayList<>(Arrays.asList(list));
		beanList = beanList.stream().filter(s-> s != null).collect(Collectors.toList());
		
		return beanList;
	}
}
