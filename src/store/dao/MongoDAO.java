package store.dao;

import store.domain.ImageFileInfoVO;

public interface MongoDAO {
	void insertImgFileInfo(ImageFileInfoVO vo);
}
