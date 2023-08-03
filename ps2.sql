CREATE SEQUENCE course_seq START WITH 451;
CREATE SEQUENCE section_seq START WITH 10;
CREATE SEQUENCE student_seq START WITH 400;

CREATE OR REPLACE TRIGGER "TRG01_COURSE" BEFORE
INSERT OR UPDATE ON course
    FOR EACH ROW
BEGIN
    IF inserting THEN
        :new.course_no := course_seq.nextval;
    END IF;
    IF updating THEN
        :new.course_no := :old.course_no;
    END IF;
END;
/
CREATE OR REPLACE TRIGGER "TRG01_SECTION" BEFORE
INSERT OR UPDATE ON section
    FOR EACH ROW
BEGIN
    IF inserting THEN
        :new.section_id := section_seq.nextval;
    END IF;
    IF updating THEN
        :new.section_id := :old.section_id;
    END IF;
END;
/
CREATE OR REPLACE TRIGGER "TRG01_STUDENT" BEFORE
INSERT OR UPDATE ON student
    FOR EACH ROW
BEGIN
    IF inserting THEN
        :new.student_id := student_seq.nextval;
    END IF;
    IF updating THEN
        :new.student_id := :old.student_id;
    END IF;
END;
/