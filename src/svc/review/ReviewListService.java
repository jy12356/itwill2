package svc.review;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ReviewDAO;
import vo.ReviewBean;

import static db.JdbcUtil.*;

public class ReviewListService {

	public ReviewBean getArticleList(int num) {
		
		System.out.println("ReviewListService - getArticleList()");
		
		Connection con = getConnection();
		
		ReviewDAO article = ReviewDAO.getInstance();
		
		article.setConnection(con);
		
//		ReviewBean article = reviewDAO.selectArticleList();
		
		// 임시 확인용 BoardBean 객체 내용 출력
//		System.out.println("글 내용 : " + article.getContent());
		
		close(con);
		
		return article;
	}

}
