-- Oracle 11g
-- Oracleにはmedian関数があるようですが、他のRDBMSについては全くわかりませんでした。解説をお願いしますm(_ _)m
select genre_id, median(uu) from uu_per_quiz group by genre_id order by genre_id;