package store.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import store.domain.ImageFileInfoVO;

@Repository
public class MongoDAOImpl implements MongoDAO {
	@Autowired
	MongoTemplate mongoTemplate;
	
	@Override
	public void insertImgFileInfo(ImageFileInfoVO vo) {
		mongoTemplate.insert(vo);
	}

}
