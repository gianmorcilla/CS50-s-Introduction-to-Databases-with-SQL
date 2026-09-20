CREATE INDEX "enrollments_studentindex" ON "enrollments" ("student_id");
CREATE INDEX "courses_index" ON "courses" ("department", "number", "semester");
CREATE INDEX "enrollments_courseindex" ON "enrollments" ("course_id");
CREATE INDEX "semester_coursesindex" ON "courses" ("semester");
CREATE INDEX "satisfies_courseindex" ON "satisfies" ("course_id");

--enrollements, courses fall 2023
--courses sprint 2024
--satisfieds and courses fall 2023
--satisfis
--courses
