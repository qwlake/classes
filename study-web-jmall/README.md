# Jmall

![screenshot](index.jpg)

---

#### 1. 회원목록 구현
- jmall이라는 database 생성 후 members 테이블 생성함
- id(회원번호), name(회원이름), uname(아이디), pass(비밀번호), email(이메일), phone(전화번호), address(주소), regdate(가입날짜)로 구성됨

```mysql
create database if not exists jmall;
use jmall;

drop table if exists members;
create table members(
id INT(10) not null auto_increasement,
name VARCHAR(20) not null,
uname VARCHAR(20) not null,
pass VARCHAR(20) not null,
email VARCHAR(45) not null,
phone VARCHAR(20) not null,
address VARCHAR(45) not null,
regdate DATE not null,
primary key(id));
```

---

#### 2. 상품페이지 구현
- jmall이라는 database 생성 후 products 테이블 생성함
- idproduct(상품번호), herf(제품링크), kinds(자전거종류), src(사진경로), corp(제조회사), pname(제품명), price(가격)로 구성됨

```mysql
create database if not exists jmall;
use jmall;

drop table if exists products;
create table products(
idproduct INT(10) not null auto_increasement,
herf VARCHAR(200) not null,
kinds VARCHAR(45) not null,
src VARCHAR(200) not null, 
corp VARCHAR(45) not null,
pname VARCHAR(45) not null,
price INT(10) not null,
primary key(idproduct));
```

---

#### 3. 장바구니 구현
- jmall이라는 database 생성 후 basket 테이블 생성함
- idbasket(장바구니번호), uname(담은회원아이디), idproduct(상품번호), count(개수), putdate(담은날짜)로 구성됨

```mysql
create database if not exists jmall;
use jmall;

drop table if exists basket;
create table basket(
idbasket INT(10) not null auto_increasement,
uname VARCHAR(20) not null,
idproduct INT(10) not null,
count INT(10) not null, 
putdate DATE not null,
primary key(idbasket));
```

---

#### 4. 주문완료 구현
- jmall이라는 database 생성 후 delivery 테이블 생성함
- idorder(장바구니번호), uname(담은회원아이디), idproduct(상품번호), count(개수), putdate(주문날짜), address(회원주소)로 구성됨

```mysql
create database if not exists jmall;
use jmall;

drop table if exists delivery;
create table delivery(
idorder INT(10) not null auto_increasement,
uname VARCHAR(20) not null,
idproduct INT(10) not null,
count INT(10) not null, 
putdate DATE not null,
address VARCHAR(45) not null,
primary key(idorder));
```
