-- CreateTable
CREATE TABLE "Type" (
    "id" BIGSERIAL NOT NULL,
    "name" CHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "created_by" CHAR(255) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "updated_by" CHAR(255) NOT NULL,

    CONSTRAINT "Type_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Category" (
    "id" BIGSERIAL NOT NULL,
    "title" CHAR(255) NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL,
    "end_date" TIMESTAMP(3) NOT NULL,
    "achivement" CHAR(255) NOT NULL,
    "punishment" CHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "created_by" CHAR(255) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "updated_by" CHAR(255) NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Challenge" (
    "id" BIGSERIAL NOT NULL,
    "challenge" CHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "category_id" BIGINT NOT NULL,
    "type_id" BIGINT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "created_by" CHAR(255) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "updated_by" CHAR(255) NOT NULL,

    CONSTRAINT "Challenge_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" BIGSERIAL NOT NULL,
    "name" CHAR(255) NOT NULL,
    "user_name" CHAR(255) NOT NULL,
    "password" TEXT NOT NULL,
    "photo_url" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserChallenge" (
    "user_di" BIGINT NOT NULL,
    "challenge_id" BIGINT NOT NULL,
    "is_done" SMALLINT NOT NULL DEFAULT 0,

    CONSTRAINT "UserChallenge_pkey" PRIMARY KEY ("user_di","challenge_id")
);

-- AddForeignKey
ALTER TABLE "Challenge" ADD CONSTRAINT "Challenge_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Challenge" ADD CONSTRAINT "Challenge_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "Type"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserChallenge" ADD CONSTRAINT "UserChallenge_user_di_fkey" FOREIGN KEY ("user_di") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserChallenge" ADD CONSTRAINT "UserChallenge_challenge_id_fkey" FOREIGN KEY ("challenge_id") REFERENCES "Challenge"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
