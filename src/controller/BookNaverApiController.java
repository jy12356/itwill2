package controller;

public class BookNaverApiController {
	private final BookService bookService; 
	@GetMapping("/api/v1/movies/{keyword}") 
	public BookBean get(@PathVariable String keyword){ 
		return moviesService.findByKeyword(keyword); 
	}

}
