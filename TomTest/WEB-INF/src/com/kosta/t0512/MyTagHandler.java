package com.kosta.t0512;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class MyTagHandler extends TagSupport {
	// 태그를 만났을 때 실행할 (로직적인)코드로 기술.

	@Override
	public int doStartTag() throws JspException {

		try {

			// 브라우저 출력 객체
			JspWriter out = pageContext.getOut();

			for (int i = 0; i < 10; i++) {
				if (i % 2 == 0) {
					out.print("<font color='red'>안녕, 커스텀태그~!!</font><br>");
				} else {
					out.print("<font color='blue'>안녕, 커스텀태그~!!</font><br>");
				}
			}

		} catch (IOException e) {
			e.printStackTrace();
		}

		return SKIP_BODY; //태그의 본문이 없는 경우 ---> 내용없음 ---> 빈태그
	} //doStartTag

	@Override
	public int doEndTag() throws JspException {

		return super.doEndTag();
	}

	@Override
	public int doAfterBody() throws JspException {

		return super.doAfterBody();
	}

}
