Work in progress utilities for converting faust to SuperCollider plugins

# Generate help file

Example workflow
```bash 
faust -json plugins/CombLPFParallelSplayed/CombLPFParallelSplayed.dsp -O .
lua faust2schelp CombLPFParallelSplayed.dsp.json
```
