package test

import (
	"testing"
)

func TestKinesisExample(t *testing.T) {
	testCloudWatchAlarm(t, "basic")
}
