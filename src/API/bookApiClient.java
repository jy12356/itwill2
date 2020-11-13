package API;

import vo.BookBean;

public class bookApiClient {
	private final RestTemplate restTemplate; 
	private final String CLIENT_ID = "P3nq6LUKrLz6LOPOVOMf"; 
	private final String CLIENT_SECRET = "f_078uxS96"; 
	private final String OpenNaverMovieUrl_getMovies = "https://openapi.naver.com/v1/search/movie.json?query={keyword}"; 
	public BookBean requestMovie(String keyword) { 
		final HttpHeaders headers = new HttpHeaders();
		// 헤더에 key들을 담아준다.
		headers.set("X-Naver-Client-Id", CLIENT_ID); 
		headers.set("X-Naver-Client-Secret", CLIENT_SECRET); 
		final HttpEntity<String> entity = new HttpEntity<>(headers); 
		return restTemplate.exchange(OpenNaverMovieUrl_getMovies, HttpMethod.GET, entity, BookBean.class, keyword).getBody(); }
	}

}
