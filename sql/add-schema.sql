<<<<<<< HEAD
=======
-- Teachers
CREATE TABLE IF NOT EXISTS /*_*/wm_teachers (
  teacher_id                  INT unsigned        NOT NULL PRIMARY KEY auto_increment,
  teacher_user_id             INT unsigned        NOT NULL, -- foreign key to users.user_id
  teacher_user_name           VARCHAR(255)        NOT NULL -- Username of the teacher
)/*$wgDBTableOptions*/;

-- Teachers index
CREATE INDEX /*i*/wm_teacher_id ON /*_*/wm_teachers (teacher_id);
CREATE INDEX /*i*/wm_teacher_user_id ON /*_*/wm_teachers (teacher_user_id);
CREATE INDEX /*i*/wm_teacher_user_name ON /*_*/wm_teachers (teacher_user_name);

>>>>>>> a2487c2f5d4d6e2ba9d49f03f8ddd97c8e0c7c34
-- Classes
CREATE TABLE IF NOT EXISTS /*_*/wm_classes (
  class_id                  INT unsigned        NOT NULL PRIMARY KEY auto_increment,
  class_name                VARCHAR(255)        NOT NULL UNIQUE, -- Name of the class
  class_teacher_user_id     INT unsigned        NOT NULL  -- foreign key to wm_teachers.teacher_user_id)
)/*$wgDBTableOptions*/;

-- Classes index
CREATE INDEX /*i*/wm_class_id ON /*_*/wm_classes (class_id);
CREATE INDEX /*i*/wm_class_name ON /*_*/wm_classes (class_name);
CREATE INDEX /*i*/wm_class_teacher_user_id ON /*_*/wm_classes (class_teacher_user_id);
<<<<<<< HEAD
=======

-- Students
CREATE TABLE IF NOT EXISTS /*_*/wm_students (
  student_id                  INT unsigned        NOT NULL PRIMARY KEY auto_increment,
  student_user_id             INT unsigned        NOT NULL, -- foreign key to users.user_id
  student_user_name           VARCHAR(255)        NOT NULL -- Username of the student
)/*$wgDBTableOptions*/;

-- Students index
CREATE INDEX /*i*/wm_student_id ON /*_*/wm_students (student_id);
CREATE INDEX /*i*/wm_student_user_id ON /*_*/wm_students (student_user_id);
CREATE INDEX /*i*/wm_student_user_name ON /*_*/wm_students (student_user_name);
>>>>>>> a2487c2f5d4d6e2ba9d49f03f8ddd97c8e0c7c34

-- Links the students with their classes.
CREATE TABLE IF NOT EXISTS /*_*/wm_students_per_class (
  student_id                INT unsigned        NOT NULL, -- Foreign key to wm_students.student_user_id
  class_id                  INT unsigned        NOT NULL, -- Foreign key on wm_classes.class_id
  enrollment_time           varbinary(14)       NOT NULL -- Time at which the student enrolled to the class

)/*$wgDBTableOptions*/;

CREATE UNIQUE INDEX /*i*/wm_student_class ON /*_*/wm_students_per_class (student_id, class_id);
CREATE INDEX /*i*/wm_class_id ON /*_*/wm_students_per_class (class_id);
CREATE INDEX /*i*/wm_enroll_time ON /*_*/wm_students_per_class (enrollment_time);

-- Tasks
CREATE TABLE IF NOT EXISTS /*_*/wm_tasks (
  task_id                  INT unsigned        NOT NULL PRIMARY KEY auto_increment,
  task_name                VARCHAR(255)        NOT NULL UNIQUE, -- Name of the task
  task_type                VARCHAR(255)        NOT NULL,  -- Edit article, create article, etc.
  task_subject             VARCHAR(255)        NOT NULL,  -- History, Mathematics, etc.
  task_description         VARCHAR(255)        NOT NULL,  -- Short description of the task.
  task_reference_link      VARCHAR(255),                  -- Link to the article.
  task_criteria            VARCHAR(255)        NOT NULL,  -- Evaluation criteria.
  class_id                 INT unsigned        NOT NULL,  -- Foreign key to wm_classes.class_id
  page_name                VARCHAR(255),                  -- Name of the article -> for fetch
  creation_date            varbinary(14)                  -- When task was created
)/*$wgDBTableOptions*/;

-- Tasks index
CREATE INDEX /*i*/wm_task_id ON /*_*/wm_tasks (task_id);
CREATE INDEX /*i*/wm_task_name ON /*_*/wm_tasks (task_name);