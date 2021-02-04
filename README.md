# README

Le dossier contient tous les éléments du projet y compris les questions bonus.
Les models sont :
- City : ont pour attribut un nom.
- User : ont plusieurs attributs et sont associés à une City.
- Gossip : sont rattachés à un User et peuvent comporter plusieurs Tag.
- Like : sont rattachés soit à un Comment, soit à un Gossip.
- Comment : sont rattachés soit à un Gossip, soit à un autre Comment. Le commentaire parent s'affiche via ``.commentable``. Les commentaires enfants s'affichent via ``.comments``.
- PrivateMessage : sont rattachés à un expéditeur. On peut leur attribuer plusieurs destinataires via le attr_accessor ``.recipients``.
- Tag : peuvent être utilisés pour qualifier un Gossip.
