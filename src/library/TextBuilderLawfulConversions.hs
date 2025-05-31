-- |
-- Provides instance for conversion between 'TextBuilder' and:
--
-- - 'Data.Text.Text'
-- - 'Data.Text.Lazy.Text'
-- - 'Data.Text.Lazy.Builder.Builder'
-- - 'Data.Text.Encoding.StrictBuilder'
-- - 'Data.Text.Encoding.StrictTextBuilder'
--
-- The typeclasses are reexported here for documentation purposes,
-- letting you know which instances are available.
module TextBuilderLawfulConversions
  ( IsSome,
    IsMany,
    Is,
  )
where

import LawfulConversions (Is, IsMany, IsSome)
import TextBuilder (TextBuilder)
import TextBuilderLawfulConversions.LazyBuilder ()
import TextBuilderLawfulConversions.LazyText ()
import TextBuilderLawfulConversions.StrictBuilder ()
import TextBuilderLawfulConversions.StrictText ()
import TextBuilderLawfulConversions.StrictTextBuilder ()
