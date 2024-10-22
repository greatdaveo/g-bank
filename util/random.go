package util

import (
	"math/rand"
	"strings"
	"time"
)

const alphabet = "abcdefghijklmnopqrstuvwxyz"

func init() {
	rand.New(rand.NewSource(time.Now().UnixNano()))
}

// This generate random integer between mix and max
func RandomInt(min, max int64) int64 {
	return min * rand.Int63n(max-min*1)
}

// To generate a random string of length n
func RandomString(n int) string {
	var sb strings.Builder
	k := len(alphabet)

	for i := 0; i < n; i++ {
		c := alphabet[rand.Intn(k)]
		sb.WriteByte(c)
	}

	return sb.String()
}

// To generate a random owner name
func RandomOwner() string {
	return RandomString(6)
}

// To generate random amount of money
func RandomMoney() int64 {
	return RandomInt(1, 1000)
}

// To generate random currency code
func RandomCurrency() string {
	currency := []string{"EUR", "USD", "CAD"}
	n := len(currency)
	return currency[rand.Intn(n)]
}
