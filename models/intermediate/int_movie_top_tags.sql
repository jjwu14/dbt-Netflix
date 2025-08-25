select
  r.movie_id,
  r.tag_id,
  r.tag,
  r.relevance,
  {{ top_n_qualify('r.movie_id','r.relevance', var('top_n_tags', 10)) }} as top_n_flag
from {{ ref('int_movie_tag_relevance') }} r
