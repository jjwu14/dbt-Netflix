{{ config(materialized='ephemeral') }}

select
  s.movie_id,
  t.tag_id,
  t.tag,
  s.relevance
from {{ ref('src_genome_scores') }} s
join {{ ref('src_genome_tags') }} t
  on s.tag_id = t.tag_id
