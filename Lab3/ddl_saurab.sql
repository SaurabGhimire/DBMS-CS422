create table college (
    id int primary key not null auto_increment,
    name varchar(255),
    phone int,
    office int
);

-- Describe college
Select 'college' as college;
describe college;

-- create department table with foreign key constraint
create table department (
    code int primary key not null,
    name varchar(255),
    phone int,
    office int,
    college_id int not null,
    foreign key (college_id) references college(id)
);

-- Describe department
Select 'department' as department;
describe department;
