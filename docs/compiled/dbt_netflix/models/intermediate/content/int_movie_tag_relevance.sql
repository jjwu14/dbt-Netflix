

select
  s.movie_id,
  t.tag_id,
  t.tag,
  s.relevance
from MOVIELENS.DEV.src_genome_scores s
join MOVIELENS.DEV.src_genome_tags t
  on s.tag_id = t.tag_id