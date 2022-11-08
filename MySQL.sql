SELECT * FROM pnusw07db.spj;

alter table spj
	add constraint spj_s_fk foreign key (sno)
    references s(sno);
    
alter table spj
	add constraint spj_p_fk foreign key (pno)
    references p(pno);
    
alter table spj
	add constraint spj_j_fk foreign key (jno)
    references j(jno);