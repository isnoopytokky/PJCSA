package spring.demo.repository;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.demo.dao.MemberDao;
import spring.demo.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SessionFactory session;

	@Override
	public void add(Member member) {
		session.getCurrentSession().save(member);
	}

	@Override
	public void edit(Member member) {
		session.getCurrentSession().update(member);
	}

	@Override
	public void delete(int id) {
		session.getCurrentSession().delete(getMember(id));
	}

	@Override
	public Member getMember(int id) {

		return (Member) session.getCurrentSession().get(Member.class, id);
	}

	@Override
	public List getAllMember() {
		// TODO Auto-generated method stub
		Query q = session.getCurrentSession().createQuery("from Member");
		List l = new ArrayList();
		if (q != null)
			return q.list();
		else
			return l;
	}

	@Override
	public List getAllMember(Member member) {
		// TODO Auto-generated method stub
		Criteria cr = session.getCurrentSession().createCriteria(Member.class);

//		if (member.getAddress() != "")
//			cr.add(Restrictions.like("address", "%"+member.getAddress()+"%"));
		
		if (member.getUser() != "")
			cr.add(Restrictions.like("user", "%"+member.getUser()+"%"));
		
		if (member.getPass() != "")
			cr.add(Restrictions.like("pass", "%"+member.getPass()+"%"));
		
		if (member.getName() != "")
			cr.add(Restrictions.like("name", "%"+member.getName()+"%"));
		
//		if (member.getAddress() != "")
//			cr.add(Restrictions.like("address", "%"+member.getAddress()+"%"));
//		
//		if (member.getCreated() != ""){
//			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//			Date date = new Date();
//			cr.add(Restrictions.between("created", member.getCreated(),date+""));
//		}
//		
//		if (member.getDistricts().getDistrictId() != null){
//			cr.add(Restrictions.eq("districts",member.getDistricts() ));
//		}else if ( member.getDistricts().getAmphures().getAmphurId() > 0 ){
//			cr.createAlias("districts.amphures", "amphures");
//			cr.add(Restrictions.eq("amphures.amphurId",member.getDistricts().getAmphures().getAmphurId() ));
//		}else if ( member.getDistricts().getAmphures().getProvinces().getprovinceId() > 0 ){
//			cr.createAlias("districts.amphures.provinces", "provinces");
//			cr.add(Restrictions.eq("provinces.provinceId",member.getDistricts().getAmphures().getProvinces().getprovinceId() ));
//		}
		
		return cr.list();
		 
	}
}
