CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	"aderess" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TYPE "SIZE" AS ENUM ('P', 'M', 'G', 'GG', 'EXGG');


CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"price" integer NOT NULL,
	"size" "SIZE" NOT NULL,
	"categoryId" TEXT,
	"mainPicture" TEXT NOT NULL,
	"picture2" TEXT,
	"picture3" TEXT,
	"picture4" TEXT,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


CREATE TYPE "SITUATION" AS ENUM ('created', 'paid', 'delivered', 'canceled');

CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"productId" integer NOT NULL,
	"amount" integer NOT NULL DEFAULT '1',
	"situation" "SITUATION" NOT NULL,
	"time" TIMESTAMP NOT NULL DEFAULT now(),
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");


ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");




