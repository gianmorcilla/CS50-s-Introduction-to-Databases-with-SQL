SELECT "english_title" AS "Top 5 Highest Contrast Painting by Hiroshige" FROM "views"
WHERE "artist" = "Hiroshige"
ORDER BY "contrast" DESC LIMIT "5";
