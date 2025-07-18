module Mir
  ( module Mir.Types,
    module Mir.Translate,
    module Mir.Liveness,
    module Mir.Allocation,
    module Mir.Interference,
    module Mir.CopyPropagation,
  )
where

import Mir.Allocation
  ( AllocationResult (..),
    RegisterAssignment,
    SpillLocation (..),
    allocateProgram,
  )
import Mir.CopyPropagation
  ( eliminateRedundantAssignments,
    optimizeFunction,
    optimizeProgram,
    performCopyPropagation,
  )
import Mir.Interference
  ( InterferenceGraph,
    buildInterferenceGraph,
    functionInterferenceGraph,
    programInterferenceGraph,
  )
import Mir.Liveness
  ( LivenessInfo (..),
    analyzeFunctionLiveness,
    analyzeProgramLiveness,
  )
import Mir.Translate
import Mir.Types
