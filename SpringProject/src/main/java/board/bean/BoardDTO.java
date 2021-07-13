package board.bean;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class BoardDTO {
	private int seq;
	private String id, name, email, subject, content;
	private int ref, lev, step, pseq, reply, hit;
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern="yyyy.MM.dd")
	private Date logtime;
}
