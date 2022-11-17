## Relation
```
 1. 명령어 
    : alter table FK테이블명
	add constraint FK테이블명_PK테이블명_fk foreign key (필드명)	//FK테이블명_PK테이블명_fk : 식별자이기때문에 내가 마음대로 설정가능
    	references PK테이블명(필드명);
    
    ↔ ALTER TABLE 테이블명
	DROP CONSTRAINT fk식별자; 
 ``` 
 2. 특징
 ```
 * foreign key: 외래 키 
      - 역할: primery key와 연결되어 있는 키(relation 만든다.)
      - relation 확인: database → reverse engineer → stored Connection 선택→ Next 
      - 특징
          - 데이터를 넣기 전에 반드시 설계를 잘 해야 한다.
          - 참조무결성: relation을 맺을 때 primery key에 없는 url이 foreign key에 들어가면 안되므로 테이블 작성 후에 연결시켜준다.
          - relation 맺어진 상태에서는 primery data 못지운다.
