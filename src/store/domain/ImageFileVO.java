package store.domain;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class ImageFileVO {
	String rCid; // 사업자 등록번호
	MultipartFile[] file;

	public MultipartFile[] getFile() {
		return file;
	}

	public void setFile(MultipartFile[] file) {
		this.file = file;

		if (file != null) {
			for (MultipartFile tmp : file) {
				UUID uid = UUID.randomUUID();
				String savedName = uid.toString() + "_" + tmp.getOriginalFilename();
				File temp = new File("C:\\Seonghyun\\finalproject\\Mukpo_copy2\\WebContent\\exc\\" + savedName);
				try {
					tmp.transferTo(temp);
				} catch (IOException e) {
					System.out.println("파일입력 예외 발생 : " + e.getMessage());
				}
			}
		}
	}

	public String getrCid() {
		return rCid;
	}

	public void setrCid(String rCid) {
		this.rCid = rCid;
	}

}
