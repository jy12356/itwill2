package svc;

public class BookService {
	private final API.bookApiClient bookApiClient; 
	@Transactional(readOnly = true) 
	public BookService findByKeyword(String keyword) { 
		return movieApiClient.requestMovie(keyword); 
	}

}
