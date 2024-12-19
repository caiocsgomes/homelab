package note

import (
	"time"

	"github.com/google/uuid"
)

type Note struct {
	ID        uuid.UUID
	CreatedAt time.Time
	Text      string
	Title     string
}

type NoteDTO struct {
	ID    string `json:"id"`
	Text  string `json:"text"`
	Title string `json:"title"`
}

func (n *Note) ToDto() *NoteDTO {
  return &NoteDTO {
    ID: n.ID.String(),
    Text: n.Text,
    Title: n.Title,
  }
}

type Notes []*Note

func (ns Notes) ToDto() []*NoteDTO {
  dtos := make([]*NoteDTO, len(ns))
  for i, n := range ns {
    dtos[i] = n.ToDto()
  }
  return dtos
}
