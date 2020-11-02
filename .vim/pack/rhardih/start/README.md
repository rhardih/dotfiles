# Notes

If vim complains saying "Sorry, no help for fugitive", maybe helptags hasn't
been generated. E.g:

```bash
vim -u NONE -c "helptags fugitive/doc" -c q
```
