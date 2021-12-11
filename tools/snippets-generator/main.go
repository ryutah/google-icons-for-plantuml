package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"strings"
	"text/template"
)

func main() {
	payload, err := loadBaseSnippets()
	if err != nil {
		panic(err)
	}
	snippets := make(Snippts)
	if err := json.Unmarshal(payload, &snippets); err != nil {
		panic(err)
	}
	results, err := renderTemplate(snippets)
	if err != nil {
		panic(err)
	}

	fmt.Println(strings.Join(results, "\n\n"))
}

var snippetTemplate = strings.TrimSpace(`
snippet {{ .Trigger }} "{{ .Description }}" b
{{ .Snippet }}
endsnippet
`)

type SnippetBody struct {
	Trigger     string
	Description string
	Snippet     string
}

type SnippetPayload struct {
	Scope       string
	Body        []string
	Description string
}

func (s SnippetPayload) JoinedBody() (string, error) {
	var w bytes.Buffer
	for _, body := range s.Body {
		if _, err := fmt.Fprintln(&w, body); err != nil {
			return "", err
		}
	}
	return strings.TrimSpace(w.String()), nil
}

type Snippts map[string]SnippetPayload

func loadBaseSnippets() ([]byte, error) {
	resp, err := http.Get("https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/.vscode/C4.code-snippets")
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	return io.ReadAll(resp.Body)
}

func renderTemplate(snippets Snippts) ([]string, error) {
	tmp, err := template.New("snippets").Parse(snippetTemplate)
	if err != nil {
		return nil, err
	}

	var results []string
	for key, snip := range snippets {
		var w bytes.Buffer
		body, err := snip.JoinedBody()
		if err != nil {
			return nil, err
		}
		if err := tmp.Execute(&w, SnippetBody{
			Trigger:     key,
			Description: snip.Description,
			Snippet:     body,
		}); err != nil {
			return nil, err
		}
		results = append(results, w.String())
	}

	return results, nil
}
